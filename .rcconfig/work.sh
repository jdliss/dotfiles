alias ssh-dev="ssh -i ~/.ssh/moto-cluster.pem $DEV_ADDR"
alias ssh-solr-dev='ssh -i ~/.ssh/moto-cluster.pem moto@$SOLR_DEV_HOST'
alias ssh-staging="ssh -i ~/.ssh/moto-cluster.pem $STAGING_ADDR"
alias ssh-solr-dev-console='echo "Connect to solr on http://localhost:9000" && ssh -i ~/.ssh/moto-cluster.pem moto@$SOLR_DEV_HOST -L 9000:localhost:8983'

ssh-web-prod-b() {
  cd $MOTO_OPS_HOME/terraform/prod-b && script/ssh-web $1
}

