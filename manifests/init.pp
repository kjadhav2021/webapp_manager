# @summary
# This is main class for the module webapp_manager
# It is special wrapper class with parameters webfeatures and iis_features of type String array
#
# @example
#   include webapp_manager
class webapp_manager (
  Array[String] $webfeatures  = ['Web-Server','Web-WebServer','Web-Mgmt-Console','Web-Mgmt-Tools'],
  Array[String] $iis_features = ['Web-WebServer','Web-Scripting-Tools'],
) {
  # installs windows web features on the node
  windowsfeature { $webfeatures:
    ensure => 'present',
  }
  # installs IIS web features
  iis_feature { $iis_features:
    ensure => 'present',
  }
  # Delete the default website to prevent a port binding conflict.
  iis_site { 'Default Web Site':
    ensure  => absent,
    require => Iis_feature['Web-WebServer'],
  }
}
