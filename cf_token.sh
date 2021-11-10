if ! command -v cloudflared &> /dev/null
then
    echo "[ ERROR ] cloudflared daemon not found -> https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/installation \n"
    exit 0
fi

FILE=.env
if [ -f "$FILE" ] && [ -z "$2" ]; then
    echo "[ CF TOKEN RETRIEVED - use 'npm run cf_token' to generate new one or remove file if you are redirect to $1] \n"
else 
    command cloudflared access login $1
    echo "CF_TOKEN=$(cloudflared access token -app=$1)" > .env
    echo "[ CF TOKEN GENERATED ] \n"
fi