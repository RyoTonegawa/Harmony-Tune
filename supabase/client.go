package supabase

import (
	"log"
	"os"

	"github.com/joho/godotenv"
	"github.com/supabase/supabase-go"
)

var Client *supabase.Client

func Init() {
	_ = godotenv.Load()

	supabaseUrl := os.Getenv("SUPABASE_URL")
	supabaseKey := os.Getenv("SUPABASE_KEY")
	var err error
	Client, err = supabase.NewClient(
		supabaseUrl,
		supabaseKey,
		nil,
	)
	if err != nil {
		log.Fatal()
	}
}
