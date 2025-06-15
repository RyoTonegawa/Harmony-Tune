# Harmony-Tune

ポイント：
*T は「T へのポインタ」であり T と別物
& … 変数のアドレス（ポインタ値）を得る
* … ポインタが指す実体を取り出す（デリファレンス）



# ── Supabase REST エンドポイント ───────────────
echo 'export SUPABASE_BASE_URL="https://wqblclcncvtoxnhpzafz.supabase.co/rest/v1/"' >> ~/.zshrc

# ── サービスロール用 API キー ───────────────────
echo 'export SUPABASE_API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndxYmxjbGNuY3Z0b3huaHB6YWZ6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk5NzMxMzEsImV4cCI6MjA2NTU0OTEzMX0.zYMQMqMGSg9eBhgltPGrlrM91FLVbaoA4WankqVoY0I"' >> ~/.zshrc

# ── Authorization ヘッダ用トークン ─────────────
echo 'export SUPABASE_AUTH_HEADER="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlmdGlhc2l4cGF3bmZ2bmR4b3FjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkyNDE1NDgsImV4cCI6MjA1NDgxNzU0OH0.5z34KlPDyGiKTmUka0aurtrCuD04NRQsko6fGk1M5k4"' >> ~/.zshrc

# ── 変更をすぐ反映 ────────────────────────────
source ~/.zshrc
