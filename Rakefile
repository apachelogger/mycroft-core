Dir.chdir(__dir__)

task :build do
  sh 'apt update'
  sh 'apt install -y pbuilder aptitude'
  sh '/usr/lib/pbuilder/pbuilder-satisfydepends'
  sh 'dpkg-buildpackage -us -uc -b -jauto'
end

task default: :build
