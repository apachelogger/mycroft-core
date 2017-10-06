env.DIST = 'xenial'
env.TYPE = 'unstable'
env.PWD_BIND = '/workspace'

cleanNode('8core-amd64') {
  stage('Clone') {
    sh 'mkdir mycroft-core'
    dir('mycroft-core') {
      checkout scm
    }
  }
  stage('Build') {
    sh '~/tooling/nci/contain.rb rake -f mycroft-core/Rakefile'
  }
}

def cleanNode(label = null, body) {
  node(label) {
    deleteDir()
    try {
      wrap([$class: 'AnsiColorBuildWrapper', colorMapName: 'xterm']) {
        wrap([$class: 'TimestamperBuildWrapper']) {
          body()
        }
      }
    } finally {
      step([$class: 'WsCleanup', cleanWhenFailure: true])
    }
  }
}
