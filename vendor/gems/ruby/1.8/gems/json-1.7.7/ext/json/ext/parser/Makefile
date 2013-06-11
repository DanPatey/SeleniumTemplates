
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = /Users/felixrodriguez/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/1.8/i686-darwin12.2.1
hdrdir = $(topdir)
VPATH = $(srcdir):$(topdir):$(hdrdir)
exec_prefix = $(prefix)
prefix = $(DESTDIR)/Users/felixrodriguez/.rvm/rubies/ree-1.8.7-2012.02
psdir = $(docdir)
sharedstatedir = $(prefix)/com
localedir = $(datarootdir)/locale
infodir = $(datarootdir)/info
libdir = $(exec_prefix)/lib
datarootdir = $(prefix)/share
libexecdir = $(exec_prefix)/libexec
docdir = $(datarootdir)/doc/$(PACKAGE)
sitedir = $(libdir)/ruby/site_ruby
bindir = $(exec_prefix)/bin
vendorarchdir = $(vendorlibdir)/$(sitearch)
sitelibdir = $(sitedir)/$(ruby_version)
sitearchdir = $(sitelibdir)/$(sitearch)
dvidir = $(docdir)
includedir = $(prefix)/include
oldincludedir = $(DESTDIR)/usr/include
rubylibdir = $(libdir)/ruby/$(ruby_version)
mandir = $(datarootdir)/man
sbindir = $(exec_prefix)/sbin
pdfdir = $(docdir)
vendordir = $(libdir)/ruby/vendor_ruby
archdir = $(rubylibdir)/$(arch)
sysconfdir = $(prefix)/etc
localstatedir = $(prefix)/var
datadir = $(datarootdir)
vendorlibdir = $(vendordir)/$(ruby_version)
htmldir = $(docdir)

CC = gcc-4.2
LIBRUBY = $(LIBRUBY_A)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = 
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)-static

RUBY_EXTCONF_H = 
CFLAGS   =  -fno-common -g -O3 -I/opt/X11/include -pipe -fno-common $(cflags) -Wall 
INCFLAGS = $(PREINCFLAGS) -I. -I/opt/local/include -I$(topdir) -I$(hdrdir) -I$(srcdir)
DEFS     = 
CPPFLAGS =  -I/opt/X11/include -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE $(DEFS) $(cppflags)
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
arch = i686-darwin12.2.1
sitearch = i686-darwin12.2.1
ruby_version = 1.8
ruby = /Users/felixrodriguez/.rvm/rubies/ree-1.8.7-2012.02/bin/ruby
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
target_prefix = /json/ext
LOCAL_LIBS = 
LIBS =   -L/opt/local/lib -ldl -lobjc  
SRCS = parser.c
OBJS = parser.o
TARGET = parser
DLLIB = $(TARGET).bundle
EXTSTATIC = 
STATIC_LIB = 

BINDIR        = $(bindir)
RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR = /Users/felixrodriguez/Documents/code/selenium/vendor/gems/ruby/1.8/gems/json-1.7.7/lib$(target_prefix)
RUBYARCHDIR = /Users/felixrodriguez/Documents/code/selenium/vendor/gems/ruby/1.8/gems/json-1.7.7/lib$(target_prefix)

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



###
parser.o: parser.c parser.h $(srcdir)/../fbuffer/fbuffer.h
