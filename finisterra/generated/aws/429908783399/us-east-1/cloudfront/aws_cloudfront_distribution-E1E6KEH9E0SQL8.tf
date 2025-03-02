module "aws_cloudfront_distribution-E1E6KEH9E0SQL8" {
  source  = "github.com/finisterra-io/terraform-aws-cloudfront?ref=6aec91c659dfbc39874375a482093da97b2194d2"
  enabled = true
  aliases = [
    "web.datasafesas.com"
  ]
  default_root_object = "index.html"
  http_version        = "http2"
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  origin = {
    "datasafeweb.s3.${local.aws_region}.amazonaws.com" : {
      "connection_attempts" : 3,
      "connection_timeout" : 10,
      "domain_name" : "datasafeweb.s3.${local.aws_region}.amazonaws.com",
      "origin_access_control_id" : "E39XWDZ1L7ACGC",
      "origin_id" : "datasafeweb.s3.${local.aws_region}.amazonaws.com"
    }
  }
  default_cache_behavior = {
    "allowed_methods" : [
      "GET",
      "HEAD",
      "OPTIONS"
    ],
    "cache_policy_name" : "Managed-CachingOptimized",
    "cached_methods" : [
      "GET",
      "HEAD",
      "OPTIONS"
    ],
    "compress" : true,
    "target_origin_id" : "datasafeweb.s3.${local.aws_region}.amazonaws.com",
    "viewer_protocol_policy" : "redirect-to-https"
  }
  viewer_certificate = {
    "acm_certificate_arn" : module.aws_acm_certificate-datasafesas_com_5d8d9aa11a.arn,
    "minimum_protocol_version" : "TLSv1.2_2021",
    "ssl_support_method" : "sni-only"
  }
}
