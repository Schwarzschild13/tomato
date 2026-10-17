-- Tomato sync: one row per account holding that person's tasks and history.
-- Run once in Supabase: SQL Editor → New query → paste → Run.

create table if not exists public.tomato (
  user_id    uuid primary key default auth.uid() references auth.users (id) on delete cascade,
  data       jsonb not null check (octet_length(data::text) < 1000000),
  rev        integer not null default 1,
  updated_at timestamptz not null default now()
);

-- Row-level security: a signed-in person can only see and change their own row.
alter table public.tomato enable row level security;

drop policy if exists "Read own data" on public.tomato;
drop policy if exists "Insert own data" on public.tomato;
drop policy if exists "Update own data" on public.tomato;

create policy "Read own data" on public.tomato
  for select to authenticated using ((select auth.uid()) = user_id);
create policy "Insert own data" on public.tomato
  for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Update own data" on public.tomato
  for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);

revoke all on public.tomato from anon;
grant select, insert, update on public.tomato to authenticated;

create or replace function public.tomato_touch() returns trigger
language plpgsql set search_path = '' as $$
begin
  new.updated_at := now();
  return new;
end $$;

drop trigger if exists tomato_touch on public.tomato;
create trigger tomato_touch before update on public.tomato
  for each row execute function public.tomato_touch();
