-- ============================================================
-- Shelf Help: Kitchen — database setup
-- Run this ONCE in Supabase: Dashboard → SQL Editor → New query
-- → paste all of this → Run. It adds two tables to the same
-- project the main Shelf Help app already uses.
-- ============================================================

-- The food currently in the kitchen
create table if not exists kitchen_items (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  portions integer not null default 1,
  use_by date,
  tags text[] not null default '{}',
  notes text not null default '',
  created_at timestamptz not null default now()
);

-- History of everything eaten or binned (feeds the Stats page)
create table if not exists kitchen_events (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  item_name text not null,
  tags text[] not null default '{}',
  event_type text not null check (event_type in ('eaten', 'binned')),
  portions integer not null default 1,
  created_at timestamptz not null default now()
);

-- Row-level security: each user can only ever see their own rows
alter table kitchen_items enable row level security;
alter table kitchen_events enable row level security;

create policy "own items" on kitchen_items
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "own events" on kitchen_events
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- Helpful index for the stats page date filter
create index if not exists kitchen_events_user_date
  on kitchen_events (user_id, created_at desc);
