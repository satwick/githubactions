#!/bin/sh

# Configure the GitHub Actions Runner
./config.sh remove --token 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
./config.sh --url https://github.com/satwickcherukuri@gmail.com/githubactions --token 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

# Start the runner
./run.sh
