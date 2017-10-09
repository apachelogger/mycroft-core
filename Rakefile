task :build do
  warn "Current dir #{Dir.pwd}"
  Dir.chdir(__dir__)
  warn "Current dir after chdir #{Dir.pwd}"
  sh 'apt update'
  sh 'apt install -y pbuilder aptitude'
  sh '/usr/lib/pbuilder/pbuilder-satisfydepends'
  sh 'dpkg-buildpackage -us -uc -b -jauto'
end

task default: :build
