#!/bin/sh

case "$1" in
  stage)
    HOST="STAGE_HOSTNAME"
    SITE="STAGE_SITENAME"
    ENV='stage'
    ;;
  prod)
    HOST="PROD_HOSTNAME"
    SITE="PROD"
    ENV='production'
    ;;
  *)
    echo "usage: deploy.sh [stage|prod]"
    exit 1
    ;;
esac

echo "deploy to $ENV : $HOST"

DT=`date +"%Y%m%d%H%M%S"`
if [ -z $VERSION ]; then
  VERSION=$DT
else
  VERSION=${VERSION/\//_}
fi
echo "version: $VERSION"

FILENAME="$SITE.$VERSION.tgz"

HOME_PATH="$(cd "`dirname "$0"`"/; pwd)"
echo "proejct root $HOME_PATH"
echo "filename $FILENAME"
cd $HOME_PATH

# Create the distribution folder
rm -rf build
# rm -rf node_modules
npm install || exit 1
REACT_APP_DIST_ENV=$ENV npm run build || exit 1
touch "build/VERSION-$VERSION"

# package
tar zcvf "/tmp/$FILENAME" -C build .

# copy data
scp "/tmp/$FILENAME" "$HOST:/tmp"
ssh -T $HOST <<EOF
sudo mkdir -p /opt/$SITE
sudo rm -rf /opt/$SITE/*
sudo tar zxvf "/tmp/$FILENAME" -C "/opt/$SITE"
sudo rm -f "/tmp/$FILENAME"
EOF

if [ $? -gt 0 ]; then
  exit 1
fi

# cleanup
rm -f "/tmp/$FILENAME"
