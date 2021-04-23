set_languages('cxx14')

add_ldflags('-undefined dynamic_lookup')

target('demo')
set_filename('demo.node')

set_kind('binary')

--add node.js headers
add_includedirs(os.getenv('NODE_HEADERS'))

add_files('$(projectdir)/src/*.cpp')