# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
	"codeberg.org/Codeberg/avatars v0.0.0-20211228163022-8da63012fe69"
	"codeberg.org/Codeberg/avatars v0.0.0-20211228163022-8da63012fe69/go.mod"
	"github.com/AndreasBriese/bbloom v0.0.0-20190306092124-e2d15f34fcf9/go.mod"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/BurntSushi/toml v0.4.1"
	"github.com/BurntSushi/toml v0.4.1/go.mod"
	"github.com/CloudyKit/fastprinter v0.0.0-20200109182630-33d98a066a53/go.mod"
	"github.com/CloudyKit/jet/v3 v3.0.0/go.mod"
	"github.com/Joker/hpp v1.0.0/go.mod"
	"github.com/KyleBanks/depth v1.2.1"
	"github.com/KyleBanks/depth v1.2.1/go.mod"
	"github.com/Masterminds/semver/v3 v3.1.1"
	"github.com/Masterminds/semver/v3 v3.1.1/go.mod"
	"github.com/PuerkitoBio/purell v1.1.1"
	"github.com/PuerkitoBio/purell v1.1.1/go.mod"
	"github.com/PuerkitoBio/urlesc v0.0.0-20170810143723-de5bf2ad4578"
	"github.com/PuerkitoBio/urlesc v0.0.0-20170810143723-de5bf2ad4578/go.mod"
	"github.com/Shopify/goreferrer v0.0.0-20181106222321-ec9c9a553398/go.mod"
	"github.com/ajg/form v1.5.1/go.mod"
	"github.com/alecthomas/template v0.0.0-20190718012654-fb15b899a751"
	"github.com/alecthomas/template v0.0.0-20190718012654-fb15b899a751/go.mod"
	"github.com/armon/consul-api v0.0.0-20180202201655-eb2c6b5be1b6/go.mod"
	"github.com/aymerick/raymond v2.0.3-0.20180322193309-b565731e1464+incompatible/go.mod"
	"github.com/cockroachdb/apd v1.1.0"
	"github.com/cockroachdb/apd v1.1.0/go.mod"
	"github.com/codegangsta/inject v0.0.0-20150114235600-33e0aa1cb7c0/go.mod"
	"github.com/coreos/etcd v3.3.10+incompatible/go.mod"
	"github.com/coreos/go-etcd v2.0.0+incompatible/go.mod"
	"github.com/coreos/go-semver v0.2.0/go.mod"
	"github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e/go.mod"
	"github.com/coreos/go-systemd v0.0.0-20190719114852-fd7a80b32e1f/go.mod"
	"github.com/cpuguy83/go-md2man v1.0.10/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d/go.mod"
	"github.com/creack/pty v1.1.7/go.mod"
	"github.com/creack/pty v1.1.9/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dgraph-io/badger v1.6.0/go.mod"
	"github.com/dgrijalva/jwt-go v3.2.0+incompatible/go.mod"
	"github.com/dgryski/go-farm v0.0.0-20190423205320-6a90982ecee2/go.mod"
	"github.com/dustin/go-humanize v1.0.0/go.mod"
	"github.com/eknkc/amber v0.0.0-20171010120322-cdade1c07385/go.mod"
	"github.com/emersion/go-sasl v0.0.0-20200509203442-7bfe0ed36a21/go.mod"
	"github.com/emersion/go-sasl v0.0.0-20211008083017-0b9dcfb154ac"
	"github.com/emersion/go-sasl v0.0.0-20211008083017-0b9dcfb154ac/go.mod"
	"github.com/emersion/go-smtp v0.15.0"
	"github.com/emersion/go-smtp v0.15.0/go.mod"
	"github.com/emvi/logbuch v1.2.0"
	"github.com/emvi/logbuch v1.2.0/go.mod"
	"github.com/etcd-io/bbolt v1.3.3/go.mod"
	"github.com/fasthttp-contrib/websocket v0.0.0-20160511215533-1f3b11f56072/go.mod"
	"github.com/fatih/structs v1.1.0/go.mod"
	"github.com/felixge/httpsnoop v1.0.1/go.mod"
	"github.com/felixge/httpsnoop v1.0.2"
	"github.com/felixge/httpsnoop v1.0.2/go.mod"
	"github.com/fsnotify/fsnotify v1.4.7/go.mod"
	"github.com/gavv/httpexpect v2.0.0+incompatible/go.mod"
	"github.com/getsentry/sentry-go v0.11.0"
	"github.com/getsentry/sentry-go v0.11.0/go.mod"
	"github.com/ghodss/yaml v1.0.0/go.mod"
	"github.com/gin-contrib/sse v0.0.0-20190301062529-5545eab6dad3/go.mod"
	"github.com/gin-gonic/gin v1.4.0/go.mod"
	"github.com/go-check/check v0.0.0-20180628173108-788fd7840127/go.mod"
	"github.com/go-co-op/gocron v1.11.0"
	"github.com/go-co-op/gocron v1.11.0/go.mod"
	"github.com/go-errors/errors v1.0.1"
	"github.com/go-errors/errors v1.0.1/go.mod"
	"github.com/go-kit/log v0.1.0/go.mod"
	"github.com/go-logfmt/logfmt v0.5.0/go.mod"
	"github.com/go-martini/martini v0.0.0-20170121215854-22fa46961aab/go.mod"
	"github.com/go-openapi/jsonpointer v0.19.3/go.mod"
	"github.com/go-openapi/jsonpointer v0.19.5"
	"github.com/go-openapi/jsonpointer v0.19.5/go.mod"
	"github.com/go-openapi/jsonreference v0.19.4/go.mod"
	"github.com/go-openapi/jsonreference v0.19.5"
	"github.com/go-openapi/jsonreference v0.19.5/go.mod"
	"github.com/go-openapi/spec v0.19.14/go.mod"
	"github.com/go-openapi/spec v0.20.2"
	"github.com/go-openapi/spec v0.20.2/go.mod"
	"github.com/go-openapi/swag v0.19.5/go.mod"
	"github.com/go-openapi/swag v0.19.11/go.mod"
	"github.com/go-openapi/swag v0.19.13"
	"github.com/go-openapi/swag v0.19.13/go.mod"
	"github.com/go-sql-driver/mysql v1.6.0"
	"github.com/go-sql-driver/mysql v1.6.0/go.mod"
	"github.com/go-stack/stack v1.8.0/go.mod"
	"github.com/gobwas/httphead v0.0.0-20180130184737-2c6c146eadee/go.mod"
	"github.com/gobwas/pool v0.2.0/go.mod"
	"github.com/gobwas/ws v1.0.2/go.mod"
	"github.com/gofrs/uuid v4.0.0+incompatible"
	"github.com/gofrs/uuid v4.0.0+incompatible/go.mod"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/gomodule/redigo v1.7.1-0.20190724094224-574c33c3df38/go.mod"
	"github.com/google/go-cmp v0.5.5"
	"github.com/google/go-cmp v0.5.5/go.mod"
	"github.com/google/go-querystring v1.0.0/go.mod"
	"github.com/google/gofuzz v1.0.0/go.mod"
	"github.com/google/renameio v0.1.0/go.mod"
	"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1/go.mod"
	"github.com/gorilla/handlers v1.5.1"
	"github.com/gorilla/handlers v1.5.1/go.mod"
	"github.com/gorilla/mux v1.8.0"
	"github.com/gorilla/mux v1.8.0/go.mod"
	"github.com/gorilla/schema v1.2.0"
	"github.com/gorilla/schema v1.2.0/go.mod"
	"github.com/gorilla/securecookie v1.1.1"
	"github.com/gorilla/securecookie v1.1.1/go.mod"
	"github.com/gorilla/websocket v1.4.1/go.mod"
	"github.com/hashicorp/go-version v1.2.0/go.mod"
	"github.com/hashicorp/golang-lru v0.5.4"
	"github.com/hashicorp/golang-lru v0.5.4/go.mod"
	"github.com/hashicorp/hcl v1.0.0/go.mod"
	"github.com/hpcloud/tail v1.0.0/go.mod"
	"github.com/imkira/go-interpol v1.1.0/go.mod"
	"github.com/inconshreveable/mousetrap v1.0.0/go.mod"
	"github.com/iris-contrib/blackfriday v2.0.0+incompatible/go.mod"
	"github.com/iris-contrib/go.uuid v2.0.0+incompatible/go.mod"
	"github.com/iris-contrib/jade v1.1.3/go.mod"
	"github.com/iris-contrib/pongo2 v0.0.1/go.mod"
	"github.com/iris-contrib/schema v0.0.1/go.mod"
	"github.com/jackc/chunkreader v1.0.0"
	"github.com/jackc/chunkreader v1.0.0/go.mod"
	"github.com/jackc/chunkreader/v2 v2.0.0/go.mod"
	"github.com/jackc/chunkreader/v2 v2.0.1"
	"github.com/jackc/chunkreader/v2 v2.0.1/go.mod"
	"github.com/jackc/pgconn v0.0.0-20190420214824-7e0022ef6ba3/go.mod"
	"github.com/jackc/pgconn v0.0.0-20190824142844-760dd75542eb/go.mod"
	"github.com/jackc/pgconn v0.0.0-20190831204454-2fabfa3c18b7/go.mod"
	"github.com/jackc/pgconn v1.8.0/go.mod"
	"github.com/jackc/pgconn v1.9.0/go.mod"
	"github.com/jackc/pgconn v1.9.1-0.20210724152538-d89c8390a530/go.mod"
	"github.com/jackc/pgconn v1.10.1"
	"github.com/jackc/pgconn v1.10.1/go.mod"
	"github.com/jackc/pgio v1.0.0"
	"github.com/jackc/pgio v1.0.0/go.mod"
	"github.com/jackc/pgmock v0.0.0-20190831213851-13a1b77aafa2/go.mod"
	"github.com/jackc/pgmock v0.0.0-20201204152224-4fe30f7445fd/go.mod"
	"github.com/jackc/pgmock v0.0.0-20210724152146-4ad1a8207f65"
	"github.com/jackc/pgmock v0.0.0-20210724152146-4ad1a8207f65/go.mod"
	"github.com/jackc/pgpassfile v1.0.0"
	"github.com/jackc/pgpassfile v1.0.0/go.mod"
	"github.com/jackc/pgproto3 v1.1.0"
	"github.com/jackc/pgproto3 v1.1.0/go.mod"
	"github.com/jackc/pgproto3/v2 v2.0.0-alpha1.0.20190420180111-c116219b62db/go.mod"
	"github.com/jackc/pgproto3/v2 v2.0.0-alpha1.0.20190609003834-432c2951c711/go.mod"
	"github.com/jackc/pgproto3/v2 v2.0.0-rc3/go.mod"
	"github.com/jackc/pgproto3/v2 v2.0.0-rc3.0.20190831210041-4c03ce451f29/go.mod"
	"github.com/jackc/pgproto3/v2 v2.0.6/go.mod"
	"github.com/jackc/pgproto3/v2 v2.1.1/go.mod"
	"github.com/jackc/pgproto3/v2 v2.2.0"
	"github.com/jackc/pgproto3/v2 v2.2.0/go.mod"
	"github.com/jackc/pgservicefile v0.0.0-20200714003250-2b9c44734f2b"
	"github.com/jackc/pgservicefile v0.0.0-20200714003250-2b9c44734f2b/go.mod"
	"github.com/jackc/pgtype v0.0.0-20190421001408-4ed0de4755e0/go.mod"
	"github.com/jackc/pgtype v0.0.0-20190824184912-ab885b375b90/go.mod"
	"github.com/jackc/pgtype v0.0.0-20190828014616-a8802b16cc59/go.mod"
	"github.com/jackc/pgtype v1.8.1-0.20210724151600-32e20a603178/go.mod"
	"github.com/jackc/pgtype v1.9.0/go.mod"
	"github.com/jackc/pgtype v1.9.1"
	"github.com/jackc/pgtype v1.9.1/go.mod"
	"github.com/jackc/pgx/v4 v4.0.0-20190420224344-cc3461e65d96/go.mod"
	"github.com/jackc/pgx/v4 v4.0.0-20190421002000-1b8f0016e912/go.mod"
	"github.com/jackc/pgx/v4 v4.0.0-pre1.0.20190824185557-6972a5742186/go.mod"
	"github.com/jackc/pgx/v4 v4.12.1-0.20210724153913-640aa07df17c/go.mod"
	"github.com/jackc/pgx/v4 v4.14.0/go.mod"
	"github.com/jackc/pgx/v4 v4.14.1"
	"github.com/jackc/pgx/v4 v4.14.1/go.mod"
	"github.com/jackc/puddle v0.0.0-20190413234325-e4ced69a3a2b/go.mod"
	"github.com/jackc/puddle v0.0.0-20190608224051-11cab39313c9/go.mod"
	"github.com/jackc/puddle v1.1.3/go.mod"
	"github.com/jackc/puddle v1.2.0/go.mod"
	"github.com/jinzhu/configor v1.2.1"
	"github.com/jinzhu/configor v1.2.1/go.mod"
	"github.com/jinzhu/inflection v1.0.0"
	"github.com/jinzhu/inflection v1.0.0/go.mod"
	"github.com/jinzhu/now v1.1.2/go.mod"
	"github.com/jinzhu/now v1.1.3/go.mod"
	"github.com/jinzhu/now v1.1.4"
	"github.com/jinzhu/now v1.1.4/go.mod"
	"github.com/josharian/intern v1.0.0"
	"github.com/josharian/intern v1.0.0/go.mod"
	"github.com/json-iterator/go v1.1.6/go.mod"
	"github.com/json-iterator/go v1.1.9/go.mod"
	"github.com/jtolds/gls v4.20.0+incompatible/go.mod"
	"github.com/k0kubun/colorstring v0.0.0-20150214042306-9440f1994b88/go.mod"
	"github.com/kataras/golog v0.0.10/go.mod"
	"github.com/kataras/iris/v12 v12.1.8/go.mod"
	"github.com/kataras/neffos v0.0.14/go.mod"
	"github.com/kataras/pio v0.0.2/go.mod"
	"github.com/kataras/sitemap v0.0.5/go.mod"
	"github.com/kevinpollet/nego v0.0.0-20200324111829-b3061ca9dd9d"
	"github.com/kevinpollet/nego v0.0.0-20200324111829-b3061ca9dd9d/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/klauspost/compress v1.8.2/go.mod"
	"github.com/klauspost/compress v1.9.7/go.mod"
	"github.com/klauspost/cpuid v1.2.1/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.1/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.2/go.mod"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/pty v1.1.8/go.mod"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/labstack/echo/v4 v4.1.11/go.mod"
	"github.com/labstack/gommon v0.3.0/go.mod"
	"github.com/leandro-lugaresi/hub v1.1.1"
	"github.com/leandro-lugaresi/hub v1.1.1/go.mod"
	"github.com/lib/pq v1.0.0/go.mod"
	"github.com/lib/pq v1.1.0/go.mod"
	"github.com/lib/pq v1.2.0/go.mod"
	"github.com/lib/pq v1.10.2"
	"github.com/lib/pq v1.10.2/go.mod"
	"github.com/lpar/gzipped/v2 v2.0.2"
	"github.com/lpar/gzipped/v2 v2.0.2/go.mod"
	"github.com/magiconair/properties v1.8.0/go.mod"
	"github.com/mailru/easyjson v0.0.0-20190614124828-94de47d64c63/go.mod"
	"github.com/mailru/easyjson v0.0.0-20190626092158-b2ccc519800e/go.mod"
	"github.com/mailru/easyjson v0.7.6/go.mod"
	"github.com/mailru/easyjson v0.7.7"
	"github.com/mailru/easyjson v0.7.7/go.mod"
	"github.com/mattn/go-colorable v0.1.1/go.mod"
	"github.com/mattn/go-colorable v0.1.2/go.mod"
	"github.com/mattn/go-colorable v0.1.6/go.mod"
	"github.com/mattn/go-isatty v0.0.5/go.mod"
	"github.com/mattn/go-isatty v0.0.7/go.mod"
	"github.com/mattn/go-isatty v0.0.8/go.mod"
	"github.com/mattn/go-isatty v0.0.9/go.mod"
	"github.com/mattn/go-isatty v0.0.12/go.mod"
	"github.com/mattn/go-sqlite3 v1.14.9/go.mod"
	"github.com/mattn/go-sqlite3 v2.0.3+incompatible"
	"github.com/mattn/go-sqlite3 v2.0.3+incompatible/go.mod"
	"github.com/mattn/goveralls v0.0.2/go.mod"
	"github.com/mediocregopher/radix/v3 v3.4.2/go.mod"
	"github.com/microcosm-cc/bluemonday v1.0.2/go.mod"
	"github.com/mitchellh/go-homedir v1.1.0/go.mod"
	"github.com/mitchellh/hashstructure/v2 v2.0.2"
	"github.com/mitchellh/hashstructure/v2 v2.0.2/go.mod"
	"github.com/mitchellh/mapstructure v1.1.2/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180228061459-e0a39a4cb421/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
	"github.com/modern-go/reflect2 v0.0.0-20180701023420-4b7aa43c6742/go.mod"
	"github.com/modern-go/reflect2 v1.0.1/go.mod"
	"github.com/moul/http2curl v1.0.0/go.mod"
	"github.com/nats-io/jwt v0.3.0/go.mod"
	"github.com/nats-io/nats.go v1.9.1/go.mod"
	"github.com/nats-io/nkeys v0.1.0/go.mod"
	"github.com/nats-io/nuid v1.0.1/go.mod"
	"github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e"
	"github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e/go.mod"
	"github.com/onsi/ginkgo v1.6.0/go.mod"
	"github.com/onsi/ginkgo v1.10.3/go.mod"
	"github.com/onsi/gomega v1.7.1/go.mod"
	"github.com/patrickmn/go-cache v2.1.0+incompatible"
	"github.com/patrickmn/go-cache v2.1.0+incompatible/go.mod"
	"github.com/pelletier/go-toml v1.2.0/go.mod"
	"github.com/pingcap/errors v0.11.4"
	"github.com/pingcap/errors v0.11.4/go.mod"
	"github.com/pkg/errors v0.8.1"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/robfig/cron/v3 v3.0.1"
	"github.com/robfig/cron/v3 v3.0.1/go.mod"
	"github.com/rogpeppe/go-internal v1.3.0/go.mod"
	"github.com/rs/xid v1.2.1/go.mod"
	"github.com/rs/zerolog v1.13.0/go.mod"
	"github.com/rs/zerolog v1.15.0/go.mod"
	"github.com/russross/blackfriday v1.5.2/go.mod"
	"github.com/russross/blackfriday/v2 v2.0.1/go.mod"
	"github.com/ryanuber/columnize v2.1.0+incompatible/go.mod"
	"github.com/satori/go.uuid v1.2.0"
	"github.com/satori/go.uuid v1.2.0/go.mod"
	"github.com/schollz/closestmatch v2.1.0+incompatible/go.mod"
	"github.com/sergi/go-diff v1.0.0/go.mod"
	"github.com/shopspring/decimal v0.0.0-20180709203117-cd690d0c9e24/go.mod"
	"github.com/shopspring/decimal v1.2.0"
	"github.com/shopspring/decimal v1.2.0/go.mod"
	"github.com/shurcooL/sanitized_anchor_name v1.0.0/go.mod"
	"github.com/sirupsen/logrus v1.4.1/go.mod"
	"github.com/sirupsen/logrus v1.4.2/go.mod"
	"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d/go.mod"
	"github.com/smartystreets/goconvey v1.6.4/go.mod"
	"github.com/spf13/afero v1.1.2/go.mod"
	"github.com/spf13/cast v1.3.0/go.mod"
	"github.com/spf13/cobra v0.0.5/go.mod"
	"github.com/spf13/jwalterweatherman v1.0.0/go.mod"
	"github.com/spf13/pflag v1.0.3/go.mod"
	"github.com/spf13/viper v1.3.2/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.1.1/go.mod"
	"github.com/stretchr/objx v0.2.0"
	"github.com/stretchr/objx v0.2.0/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.5.1/go.mod"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"github.com/stretchr/testify v1.7.0"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/swaggo/swag v1.7.0"
	"github.com/swaggo/swag v1.7.0/go.mod"
	"github.com/ugorji/go v1.1.4/go.mod"
	"github.com/ugorji/go v1.1.7/go.mod"
	"github.com/ugorji/go/codec v0.0.0-20181204163529-d75b2dcb6bc8/go.mod"
	"github.com/ugorji/go/codec v1.1.7/go.mod"
	"github.com/urfave/cli/v2 v2.3.0/go.mod"
	"github.com/urfave/negroni v1.0.0/go.mod"
	"github.com/valyala/bytebufferpool v1.0.0/go.mod"
	"github.com/valyala/fasthttp v1.6.0/go.mod"
	"github.com/valyala/fasttemplate v1.0.1/go.mod"
	"github.com/valyala/tcplisten v0.0.0-20161114210144-ceec8f93295a/go.mod"
	"github.com/xeipuuv/gojsonpointer v0.0.0-20180127040702-4e3ac2762d5f/go.mod"
	"github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415/go.mod"
	"github.com/xeipuuv/gojsonschema v1.2.0/go.mod"
	"github.com/xordataexchange/crypt v0.0.3-0.20170626215501-b2862e3d0a77/go.mod"
	"github.com/yalp/jsonpath v0.0.0-20180802001716-5cc68e5049a0/go.mod"
	"github.com/yudai/gojsondiff v1.0.0/go.mod"
	"github.com/yudai/golcs v0.0.0-20170316035057-ecda9a501e82/go.mod"
	"github.com/yudai/pp v2.0.1+incompatible/go.mod"
	"github.com/yuin/goldmark v1.2.1/go.mod"
	"github.com/zenazn/goji v0.9.0/go.mod"
	"go.uber.org/atomic v1.3.2/go.mod"
	"go.uber.org/atomic v1.4.0/go.mod"
	"go.uber.org/atomic v1.5.0/go.mod"
	"go.uber.org/atomic v1.6.0/go.mod"
	"go.uber.org/atomic v1.9.0"
	"go.uber.org/atomic v1.9.0/go.mod"
	"go.uber.org/multierr v1.1.0/go.mod"
	"go.uber.org/multierr v1.3.0/go.mod"
	"go.uber.org/multierr v1.5.0/go.mod"
	"go.uber.org/tools v0.0.0-20190618225709-2cfd321de3ee/go.mod"
	"go.uber.org/zap v1.9.1/go.mod"
	"go.uber.org/zap v1.10.0/go.mod"
	"go.uber.org/zap v1.13.0/go.mod"
	"golang.org/x/crypto v0.0.0-20181203042331-505ab145d0a9/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190411191339-88737f569e3a/go.mod"
	"golang.org/x/crypto v0.0.0-20190510104115-cbcb75029529/go.mod"
	"golang.org/x/crypto v0.0.0-20190701094942-4def268fd1a4/go.mod"
	"golang.org/x/crypto v0.0.0-20190820162420-60c769a6c586/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20191227163750-53104e6ec876/go.mod"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
	"golang.org/x/crypto v0.0.0-20201203163018-be400aefbc4c/go.mod"
	"golang.org/x/crypto v0.0.0-20210616213533-5ff15b29337e/go.mod"
	"golang.org/x/crypto v0.0.0-20210711020723-a769d52b0f97/go.mod"
	"golang.org/x/crypto v0.0.0-20210921155107-089bfa567519/go.mod"
	"golang.org/x/crypto v0.0.0-20211209193657-4570a0811e8b"
	"golang.org/x/crypto v0.0.0-20211209193657-4570a0811e8b/go.mod"
	"golang.org/x/lint v0.0.0-20190930215403-16217165b5de/go.mod"
	"golang.org/x/mod v0.0.0-20190513183733-4bf6d317e70e/go.mod"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
	"golang.org/x/mod v0.3.0"
	"golang.org/x/mod v0.3.0/go.mod"
	"golang.org/x/net v0.0.0-20180906233101-161cd47e91fd/go.mod"
	"golang.org/x/net v0.0.0-20181220203305-927f97764cc3/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190327091125-710a502c58a2/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190503192946-f4e77d36d62c/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20190813141303-74dc4d7220e7/go.mod"
	"golang.org/x/net v0.0.0-20190827160401-ba9fcec4b297/go.mod"
	"golang.org/x/net v0.0.0-20191209160850-c0dbc17a3553/go.mod"
	"golang.org/x/net v0.0.0-20201021035429-f5854403a974/go.mod"
	"golang.org/x/net v0.0.0-20201110031124-69a78807bb2b/go.mod"
	"golang.org/x/net v0.0.0-20210119194325-5f4716e94777/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20211112202133-69e39bad7dc2"
	"golang.org/x/net v0.0.0-20211112202133-69e39bad7dc2/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod"
	"golang.org/x/sync v0.0.0-20201020160332-67f06af15bc9/go.mod"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c/go.mod"
	"golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33/go.mod"
	"golang.org/x/sys v0.0.0-20180909124046-d0be0721c37e/go.mod"
	"golang.org/x/sys v0.0.0-20181205085412-a5c9d58dba9a/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
	"golang.org/x/sys v0.0.0-20190403152447-81d4e9dc473e/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190422165155-953cdadca894/go.mod"
	"golang.org/x/sys v0.0.0-20190626221950-04f50cda93cb/go.mod"
	"golang.org/x/sys v0.0.0-20190813064441-fde4db37ae7a/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
	"golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae/go.mod"
	"golang.org/x/sys v0.0.0-20200930185726-fdedc70b468f/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210119212857-b64e53b001e4/go.mod"
	"golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/term v0.0.0-20201117132131-f5c789dd3221/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.4/go.mod"
	"golang.org/x/text v0.3.5/go.mod"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/text v0.3.7"
	"golang.org/x/text v0.3.7/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20181221001348-537d06c36207/go.mod"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd/go.mod"
	"golang.org/x/tools v0.0.0-20190327201419-c70d86f8b7cf/go.mod"
	"golang.org/x/tools v0.0.0-20190328211700-ab21143f2384/go.mod"
	"golang.org/x/tools v0.0.0-20190425163242-31fd60d6bfdc/go.mod"
	"golang.org/x/tools v0.0.0-20190621195816-6e04913cbbac/go.mod"
	"golang.org/x/tools v0.0.0-20190823170909-c4a336ef6a2f/go.mod"
	"golang.org/x/tools v0.0.0-20191029041327-9cc4af7d6b2c/go.mod"
	"golang.org/x/tools v0.0.0-20191029190741-b9c20aec41a5/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.0.0-20200103221440-774c71fcf114/go.mod"
	"golang.org/x/tools v0.0.0-20201120155355-20be4ac4bd6e/go.mod"
	"golang.org/x/tools v0.1.0"
	"golang.org/x/tools v0.1.0/go.mod"
	"golang.org/x/xerrors v0.0.0-20190410155217-1f06c39b4373/go.mod"
	"golang.org/x/xerrors v0.0.0-20190513163551-3ee3066db522/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f"
	"gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f/go.mod"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"gopkg.in/fsnotify.v1 v1.4.7/go.mod"
	"gopkg.in/go-playground/assert.v1 v1.2.1/go.mod"
	"gopkg.in/go-playground/validator.v8 v8.18.2/go.mod"
	"gopkg.in/inconshreveable/log15.v2 v2.0.0-20180818164646-67afb5ed74ec/go.mod"
	"gopkg.in/ini.v1 v1.51.1/go.mod"
	"gopkg.in/mgo.v2 v2.0.0-20180705113604-9856a29383ce/go.mod"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.3/go.mod"
	"gopkg.in/yaml.v2 v2.2.4/go.mod"
	"gopkg.in/yaml.v2 v2.3.0/go.mod"
	"gopkg.in/yaml.v2 v2.4.0"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20191120175047-4206685974f2/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200615113413-eeeca48fe776/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b"
	"gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b/go.mod"
	"gorm.io/driver/mysql v1.2.1"
	"gorm.io/driver/mysql v1.2.1/go.mod"
	"gorm.io/driver/postgres v1.2.3"
	"gorm.io/driver/postgres v1.2.3/go.mod"
	"gorm.io/driver/sqlite v1.2.6"
	"gorm.io/driver/sqlite v1.2.6/go.mod"
	"gorm.io/gorm v1.22.3/go.mod"
	"gorm.io/gorm v1.22.4"
	"gorm.io/gorm v1.22.4/go.mod"
	"honnef.co/go/tools v0.0.1-2019.2.3/go.mod"
)

go-module_set_globals

DESCRIPTION="A minimalist, self-hosted WakaTime-compatible backend for coding statistics"
HOMEPAGE="https://wakapi.dev/ https://github.com/muety/wakapi"
SRC_URI="https://github.com/muety/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

src_compile() {
	go build -o "${PN}"
}

src_install() {
	dobin "${PN}"
	insinto /etc/${PN}
	newins config.default.yml config.yml
}
