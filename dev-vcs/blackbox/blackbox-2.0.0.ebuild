# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module

EGO_SUM=(
	"github.com/BurntSushi/toml v0.3.1/go.mod h1:xHWCNGjB5oqiDr8zfno3MHue2Ht5sIBksp03qcyfWMU="
	"github.com/StackExchange/blackbox v0.0.0-20200527125317-e049c02655d2 h1:iihTTtoGPPfol75KUvwzSe+dlrVlAA78Ky2r+PA/tI0="
	"github.com/andreyvit/diff v0.0.0-20170406064948-c7f18ee00883 h1:bvNMNQO63//z+xNgfBlViaCIJKLlCJ6/fmUseuG0wVQ="
	"github.com/andreyvit/diff v0.0.0-20170406064948-c7f18ee00883/go.mod h1:rCTlJbsFo29Kk6CurOXKm700vrz8f0KW0JNfpkRJY/8="
	"github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d h1:U+s90UTSYgptZMwQh2aRr3LuazLJIa+Pg3Kc1ylSYVY="
	"github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d/go.mod h1:maD7wRr/U5Z6m/iR4s+kqSMx2CaBsrgA7czyZG/E6dU="
	"github.com/davecgh/go-spew v1.1.0/go.mod h1:J7Y8YcW2NihsgmVo/mv3lAwl/skON4iLHjSsI+c5H38="
	"github.com/davecgh/go-spew v1.1.1 h1:vj9j/u1bqnvCEfJOwUhtlOARqs3+rkHYY13jYWTU97c="
	"github.com/davecgh/go-spew v1.1.1/go.mod h1:J7Y8YcW2NihsgmVo/mv3lAwl/skON4iLHjSsI+c5H38="
	"github.com/kr/pretty v0.1.0 h1:L/CwN0zerZDmRFUapSPitk6f+Q3+0za1rQkzVuMiMFI="
	"github.com/kr/pretty v0.1.0/go.mod h1:dAy3ld7l9f0ibDNOQOHHMYYIIbhfbHSm3C4ZsoJORNo="
	"github.com/kr/pty v1.1.1/go.mod h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3cYio2l3bCsQ="
	"github.com/kr/text v0.1.0 h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaKSTVE="
	"github.com/kr/text v0.1.0/go.mod h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx/iVham/4vfdArNI="
	"github.com/mattn/go-runewidth v0.0.7 h1:Ei8KR0497xHyKJPAv59M1dkC+rOZCMBJ+t3fZ+twI54="
	"github.com/mattn/go-runewidth v0.0.7/go.mod h1:H031xJmbD/WCDINGzjvQ9THkh0rPKHF+m2gUSrubnMI="
	"github.com/mattn/go-runewidth v0.0.9 h1:Lm995f3rfxdpd6TSmuVCHVb/QhupuXlYr8sCI/QdE+0="
	"github.com/mattn/go-runewidth v0.0.9/go.mod h1:H031xJmbD/WCDINGzjvQ9THkh0rPKHF+m2gUSrubnMI="
	"github.com/olekukonko/tablewriter v0.0.4 h1:vHD/YYe1Wolo78koG299f7V/VAS08c6IpCLn+Ejf/w8="
	"github.com/olekukonko/tablewriter v0.0.4/go.mod h1:zq6QwlOf5SlnkVbMSr5EoBv3636FWnp+qbPhuoO21uA="
	"github.com/pmezard/go-difflib v1.0.0 h1:4DBwDE0NGyQoBHbLQYPwSUPoCMWR5BEzIk/f1lZbAQM="
	"github.com/pmezard/go-difflib v1.0.0/go.mod h1:iKH77koFhYxTK1pcRnkKkqfTogsbg7gZNVY4sRDYZ/4="
	"github.com/russross/blackfriday/v2 v2.0.1 h1:lPqVAte+HuHNfhJ/0LC98ESWRz8afy9tM/0RK8m9o+Q="
	"github.com/russross/blackfriday/v2 v2.0.1/go.mod h1:+Rmxgy9KzJVeS9/2gXHxylqXiyQDYRxCVz55jmeOWTM="
	"github.com/sergi/go-diff v1.1.0 h1:we8PVUC3FE2uYfodKH/nBHMSetSfHDR6scGdBi+erh0="
	"github.com/sergi/go-diff v1.1.0/go.mod h1:STckp+ISIX8hZLjrqAeVduY0gWCT9IjLuqbuNXdaHfM="
	"github.com/shurcooL/sanitized_anchor_name v1.0.0 h1:PdmoCO6wvbs+7yrJyMORt4/BmY5IYyJwS/kOiWx8mHo="
	"github.com/shurcooL/sanitized_anchor_name v1.0.0/go.mod h1:1NzhyTcUVG4SuEtjjoZeVRXNmyL/1OwPU0+IJeTBvfc="
	"github.com/stretchr/objx v0.1.0/go.mod h1:HFkY916IF+rwdDfMAkV7OtwuqBVzrE8GR6GFx+wExME="
	"github.com/stretchr/testify v1.4.0 h1:2E4SXV/wtOkTonXsotYi4li6zVWxYlZuYNCXe9XRJyk="
	"github.com/stretchr/testify v1.4.0/go.mod h1:j7eGeouHqKxXV5pUuKE4zz7dFj8WfuZ+81PSLYec5m4="
	"github.com/urfave/cli/v2 v2.2.0 h1:JTTnM6wKzdA0Jqodd966MVj4vWbbquZykeX1sKbe2C4="
	"github.com/urfave/cli/v2 v2.2.0/go.mod h1:SE9GqnLQmjVa0iPEY0f1w3ygNIYcIJ0OKPMoW2caLfQ="
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod h1:Co6ibVJAznAaIkqp8huTwlJQCZ016jof/cbN4VW5Yz0="
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15 h1:YR8cESwS4TdDjEe65xsg0ogRM/Nc3DYOhEAlW+xobZo="
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod h1:Co6ibVJAznAaIkqp8huTwlJQCZ016jof/cbN4VW5Yz0="
	"gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI="
	"gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I="
	"gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI="
)

go-module_set_globals

DESCRIPTION="Safely store secrets in Git/Mercurial/Subversion"
HOMEPAGE="https://github.com/StackExchange/blackbox"
SRC_URI="https://github.com/StackExchange/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"

src_compile() {
	env GO111MODULE=on GOOS=linux go build -o ${PN} \
		-ldflags "-s -w -X main.SHA=d45564d -X main.BuildTime=$(date +%s)" \
		github.com/StackExchange/blackbox/v2/cmd/blackbox
}

src_install() {
	dobin "${PN}"
	dobin binv2/*
	einstalldocs
}
