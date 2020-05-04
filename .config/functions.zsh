#!/usr/bin/env zsh
function proxyoff() {
    unset {HTTP,HTTPS}_PROXY {http,https,ftp}_proxy
}

function awless() {
    docker run --rm -it -v ${HOME}/.aws:/root/.aws awless awless $@
}

function jsontoyaml() {
    file=$(echo $@ | cut -f1 -d'.')
    ruby -ryaml -rjson -e 'puts YAML.dump(JSON.parse(STDIN.read))' < $file.json > $file.yaml
}

function yamltojson() {
    file=$(echo $1 | cut -f1 -d'.')
    ruby -rjson -ryaml -e "puts YAML.load_file('$1').to_json" > $file.json
}

function lint-cfn() {
    which cfn-lint >/dev/null 2>&1 || { echo "cfn-lint cannot be found!"; echo "run: pip3 install cfn-lint"; exit 1; }
    aws cloudformation get-template --stack-name $1 --output text --query "TemplateBody" > $1.stack.tmp
    cfn-lint -f parseable -t $1.stack.tmp
    rm -f $1.stack.tmp
}
    # for i in $(aws cloudformation describe-stacks | jq -r '.[][]|select(.StackName | startswith("app")).StackName'); do echo "linting .. $i"; lint-cfn $i | awk '{print "- "$0}'; done

function apps() {
    code $HOME/Documents/apps.md
}

function notes() {
    vim $HOME/notes.md

    printf "uploading to github .. "
    gist --update 1139b8fe58856e8d19c63c8374eb1766 $HOME/notes.md >/dev/null 2>&1 || { printf "error!\n"; exit 1; }
    printf "done!\n"
}

function parse_yaml() {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}

function run_dynamodb() {
    DDB_DIR="$HOME/.bin/dynamodb"
    java -Djava.library.path=$DDB_DIR/DynamoDBLocal_lib -jar $DDB_DIR/DynamoDBLocal.jar -sharedDb
}

function setup_dynamodb() {
    aws dynamodb create-table \
    --table-name dynamodb-local \
    --attribute-definitions \
    AttributeName=appId,AttributeType=S \
    --key-schema \
    AttributeName=appId,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url http://localhost:8000
}
