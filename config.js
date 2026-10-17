/* Sync settings. Leave both empty to keep Tomato local-only.
   Find these in Supabase: Project Settings → API. The publishable (or legacy anon)
   key is meant to be public; the row-level security in supabase/schema.sql is what
   keeps each person's data private. Never put the secret / service_role key here. */
window.TOMATO_SYNC = {
  url: 'https://aqywqocnossuwnqltlgf.supabase.co',
  key: 'sb_publishable_LdlJzFp-J91aSd0pXWHk9A_ncr3kxgf'
};
