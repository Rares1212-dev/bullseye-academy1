-- Run this in your Supabase SQL Editor
create table if not exists waitlist (
  id         bigint generated always as identity primary key,
  email      text not null unique,
  joined_at  timestamptz not null default now()
);

-- Allow anonymous inserts (needed for client-side Supabase)
alter table waitlist enable row level security;

create policy "Anyone can join waitlist"
  on waitlist for insert
  with check (true);

-- Optional: prevent reading emails from the client (security)
create policy "No public reads"
  on waitlist for select
  using (false);
