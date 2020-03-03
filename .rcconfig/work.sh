alias ssh-dev="ssh -i $DEV_KEY $DEV_ADDR"
alias ssh-solr-dev="ssh -i $DEV_KEY $SOLR_DEV_ADDR"
alias ssh-staging="ssh -i $DEV_KEY $STAGING_ADDR"
alias ssh-solr-dev-console="echo 'Connect to solr on http://localhost:9000' && ssh -i $DEV_KEY $SOLR_DEV_ADDR -L 9000:localhost:8983"

ssh-web-prod-b() {
  cd $MOTO_OPS_HOME/terraform/prod-b && script/ssh-web $1
}

ssh-batch-instance() {
  ssh -i $TAXO_KEY ec2-user@$1
}
