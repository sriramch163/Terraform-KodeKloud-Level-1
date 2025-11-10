resource "aws_opensearch_domain" "xfusion-es" {
  domain_name    = "xfusion-es"
  engine_version = "Elasticsearch_7.10"
}