//go:build setup

package main

import (
	"io"
	"os"
	"path/filepath"
)

func main() {
	src := "scripts/pre-commit.sh"
	dst := filepath.Join(".git", "hooks", "pre-commit")

	if err := copyFile(src, dst); err != nil {

		os.Exit(1)
	}

	if err := os.Chmod(dst, 0755); err != nil {

		os.Exit(1)
	}

}

func copyFile(src, dst string) error {
	in, err := os.Open(src)
	if err != nil {
		return err
	}
	defer in.Close()

	out, err := os.Create(dst)
	if err != nil {
		return err
	}
	defer out.Close()

	_, err = io.Copy(out, in)
	return err
}
