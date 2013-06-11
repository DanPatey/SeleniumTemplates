
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = /Users/dan/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/1.8/i686-darwin11.4.0
hdrdir = $(topdir)
VPATH = $(srcdir):$(topdir):$(hdrdir)
exec_prefix = $(prefix)
prefix = $(DESTDIR)/Users/dan/.rvm/rubies/ree-1.8.7-2012.02
infodir = $(datarootdir)/info
psdir = $(docdir)
vendordir = $(libdir)/ruby/vendor_ruby
libexecdir = $(exec_prefix)/libexec
libdir = $(exec_prefix)/lib
includedir = $(prefix)/include
vendorlibdir = $(vendordir)/$(ruby_version)
oldincludedir = $(DESTDIR)/usr/include
dvidir = $(docdir)
sitelibdir = $(sitedir)/$(ruby_version)
datadir = $(datarootdir)
mandir = $(datarootdir)/man
archdir = $(rubylibdir)/$(arch)
localstatedir = $(prefix)/var
localedir = $(datarootdir)/locale
sitedir = $(libdir)/ruby/site_ruby
vendorarchdir = $(vendorlibdir)/$(sitearch)
pdfdir = $(docdir)
sysconfdir = $(prefix)/etc
bindir = $(exec_prefix)/bin
sbindir = $(exec_prefix)/sbin
docdir = $(datarootdir)/doc/$(PACKAGE)
sharedstatedir = $(prefix)/com
sitearchdir = $(sitelibdir)/$(sitearch)
htmldir = $(docdir)
datarootdir = $(prefix)/share
rubylibdir = $(libdir)/ruby/$(ruby_version)

CC = /usr/bin/gcc-4.2
LIBRUBY = $(LIBRUBY_A)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = 
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)-static

RUBY_EXTCONF_H = extconf.h
CFLAGS   =  -fno-common -g -O2  -pipe -fno-common $(cflags) -Wno-declaration-after-statement  
INCFLAGS = $(PREINCFLAGS) -I. -I/opt/local/include -I. -I/Users/dan/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/1.8/i686-darwin11.4.0 -I.
DEFS     = 
CPPFLAGS = -DRUBY_EXTCONF_H=\"$(RUBY_EXTCONF_H)\"  -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE  
CXXFLAGS = $(CFLAGS) 
ldflags  = -L. 
dldflags = 
archflag = 
DLDFLAGS = $(ldflags) $(dldflags) $(archflag)
LDSHARED = cc -dynamic -bundle -undefined suppress -flat_namespace
AR = ar
EXEEXT = 

RUBY_INSTALL_NAME = ruby
RUBY_SO_NAME = ruby
arch = i686-darwin11.4.0
sitearch = i686-darwin11.4.0
ruby_version = 1.8
ruby = /Users/dan/.rvm/rubies/ree-1.8.7-2012.02/bin/ruby
RUBY = $(ruby)
RM = rm -f
MAKEDIRS = mkdir -p
INSTALL = /usr/bin/install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp

#### End of system configuration section. ####

preload = 

libpath = . $(libdir)
LIBPATH =  -L. -L$(libdir)
DEFFILE = 

CLEANFILES = mkmf.log
DISTCLEANFILES = 

extout = 
extout_prefix = 
target_prefix = 
LOCAL_LIBS = 
LIBS =   -L/opt/local/lib -ldl -lobjc  
SRCS = AbstractMemory.c ArrayType.c Buffer.c Call.c ClosurePool.c DataConverter.c DynamicLibrary.c ffi.c Function.c FunctionInfo.c LastError.c MappedType.c MemoryPointer.c MethodHandle.c Platform.c Pointer.c Struct.c StructByReference.c StructByValue.c StructLayout.c Thread.c Type.c Types.c Variadic.c
OBJS = AbstractMemory.o ArrayType.o Buffer.o Call.o ClosurePool.o DataConverter.o DynamicLibrary.o ffi.o Function.o FunctionInfo.o LastError.o MappedType.o MemoryPointer.o MethodHandle.o Platform.o Pointer.o Struct.o StructByReference.o StructByValue.o StructLayout.o Thread.o Type.o Types.o Variadic.o
TARGET = ffi_c
DLLIB = $(TARGET).bundle
EXTSTATIC = 
STATIC_LIB = 

BINDIR        = $(bindir)
RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR = /Users/dan/Documents/Code/selenium/vendor/gems/ruby/1.8/gems/ffi-1.0.11/lib$(target_prefix)
RUBYARCHDIR = /Users/dan/Documents/Code/selenium/vendor/gems/ruby/1.8/gems/ffi-1.0.11/lib$(target_prefix)

TARGET_SO     = $(DLLIB)
CLEANLIBS     = $(TARGET).bundle $(TARGET).il? $(TARGET).tds $(TARGET).map
CLEANOBJS     = *.o *.a *.s[ol] *.pdb *.exp *.bak

all:		$(DLLIB)
static:		$(STATIC_LIB)

clean:
		@-$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES)

distclean:	clean
		@-$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		@-$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)

realclean:	distclean
install: install-so install-rb

install-so: $(RUBYARCHDIR)
install-so: $(RUBYARCHDIR)/$(DLLIB)
$(RUBYARCHDIR)/$(DLLIB): $(DLLIB)
	$(INSTALL_PROG) $(DLLIB) $(RUBYARCHDIR)
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
$(RUBYARCHDIR):
	$(MAKEDIRS) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .cxx .cpp .C .o

.cc.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cxx.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cpp.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.C.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.c.o:
	$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) -c $<

$(DLLIB): $(OBJS) Makefile
	@-$(RM) $@
	$(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)



$(OBJS): ruby.h defines.h $(RUBY_EXTCONF_H)
LIBFFI_HOST=--host=
include ${srcdir}/libffi.darwin.mk
