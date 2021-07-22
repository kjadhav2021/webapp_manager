# @summary
# This class sllows creation of a new IIS Web Site and configuration of site parameters.
#
# @example
#   include webapp_manager::website
#
# @param site_title
#   This is a site title. It ensures as a string value such as 'basic'
# @param site_directory
#   It is physical path to the site directory. This path must be fully qualified.
# @param tmp_directory
#   It is physical path to the temp directory for archive extraction. This path must be fully qualified
# @param archive_title
#   This is a archive title. It ensures as a string value such as 'index.zip'
# @param archive_src
#   It is archive file source.supports http|https|ftp|file|s3|gs uri.
# @param file_title
#   It is an index file title.
# @param index_file_src
#   It is physical path to the index.file after archive extraction in temp directory
# @param site_app_pool
#   This is application pool name.
class webapp_manager::website (
  String $website_title  = 'basic-site',
  String $site_directory = 'C:\\inetpub\\basic',
  String $site_app_pool  = 'basic_site_app_pool',
) {
  iis_site { $website_title:
    ensure          => 'started',
    physicalpath    => $site_directory,
    applicationpool => $site_app_pool,
  }
}
