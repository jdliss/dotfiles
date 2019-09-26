alias ssh-staging="ssh -i ~/.ssh/moto-cluster.pem $STAGING_ADDR"
alias ssh-dev="ssh -i ~/.ssh/moto-cluster.pem $DEV_ADDR"
alias moto-solr-console='echo "Connect to solr on http://localhost:9000" && ssh -i ~/.ssh/moto-cluster.pem moto@$SOLR_DEV_HOST -L 9000:localhost:8983'
alias moto-solr-ssh='ssh -i ~/.ssh/moto-cluster.pem moto@$SOLR_DEV_HOST'

