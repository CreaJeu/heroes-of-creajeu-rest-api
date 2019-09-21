#!/bin/bash
curl \
	--header "Content-Type: application/json" \
	--request POST \
	--data '{"target_hero_id":1}' \
	http://localhost:3000/rpc/get_hero_achievements
echo '\n'
