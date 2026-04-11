import { createClient } from "@supabase/supabase-js";

const supabaseUrl = "https://ssflbxgjhrknaruozjjy.supabase.co";
const supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNzZmxieGdqaHJrbmFydW96amp5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzU5MDcwNzQsImV4cCI6MjA5MTQ4MzA3NH0.qVPTVCFxW6Z3ddkOfyKunu7CBFCMJfsyYTGZqoHj-P0";

export const supabase = createClient(supabaseUrl, supabaseKey);