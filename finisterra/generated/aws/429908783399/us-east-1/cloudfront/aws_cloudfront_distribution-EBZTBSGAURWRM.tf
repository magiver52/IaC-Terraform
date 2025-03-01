module "aws_cloudfront_distribution-EBZTBSGAURWRM" {
  source              = "github.com/finisterra-io/terraform-aws-cloudfront?ref=v1.0.2"
  enabled             = true
  default_root_object = "index.html"
  http_version        = "http2"
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  origin = {
    "libresparaamar.s3.${local.aws_region}.amazonaws.com" : {
      "connection_attempts" : 3,
      "connection_timeout" : 10,
      "domain_name" : "libresparaamar.s3.${local.aws_region}.amazonaws.com",
      "origin_access_control_id" : "E1OQ4P7MVG24WZ",
      "origin_id" : "libresparaamar.s3.${local.aws_region}.amazonaws.com"
    }
  }
  default_cache_behavior = {
    "allowed_methods" : [
      "GET",
      "HEAD"
    ],
    "cache_policy_name" : "Managed-CachingOptimized",
    "cached_methods" : [
      "GET",
      "HEAD"
    ],
    "compress" : true,
    "target_origin_id" : "libresparaamar.s3.${local.aws_region}.amazonaws.com",
    "viewer_protocol_policy" : "redirect-to-https"
  }
  viewer_certificate = {
    "cloudfront_default_certificate" : true,
    "minimum_protocol_version" : "TLSv1"
  }
}
