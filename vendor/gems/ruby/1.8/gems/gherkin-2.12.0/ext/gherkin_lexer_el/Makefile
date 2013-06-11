
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = /Users/felixrodriguez/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/1.8/i686-darwin12.2.1
hdrdir = $(topdir)
VPATH = $(srcdir):$(topdir):$(hdrdir)
exec_prefix = $(prefix)
prefix = $(DESTDIR)/Users/felixrodriguez/.rvm/rubies/ree-1.8.7-2012.02
sharedstatedir = $(prefix)/com
bindir = $(exec_prefix)/bin
libdir = $(exec_prefix)/lib
libexecdir = $(exec_prefix)/libexec
htmldir = $(docdir)
sitelibdir = $(sitedir)/$(ruby_version)
datarootdir = $(prefix)/share
datadir = $(datarootdir)
docdir = $(datarootdir)/doc/$(PACKAGE)
dvidir = $(docdir)
archdir = $(rubylibdir)/$(arch)
sitedir = $(libdir)/ruby/site_ruby
sysconfdir = $(prefix)/etc
includedir = $(prefix)/include
vendorarchdir = $(vendorlibdir)/$(sitearch)
sbindir = $(exec_prefix)/sbin
localedir = $(datarootdir)/locale
sitearchdir = $(sitelibdir)/$(sitearch)
infodir = $(datarootdir)/info
mandir = $(datarootdir)/man
psdir = $(docdir)
vendorlibdir = $(vendordir)/$(ruby_version)
vendordir = $(libdir)/ruby/vendor_ruby
pdfdir = $(docdir)
oldincludedir = $(DESTDIR)/usr/include
rubylibdir = $(libdir)/ruby/$(ruby_version)
localstatedir = $(prefix)/var

CC = gcc-4.2
LIBRUBY = $(LIBRUBY_A)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = 
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)-static

RUBY_EXTCONF_H = 
CFLAGS   =  -fno-common -g -O2 -I/opt/X11/include -pipe -fno-common $(cflags) -O0 -Wall 
INCFLAGS = $(PREINCFLAGS) -I. -I/opt/local/include -I. -I/Users/felixrodriguez/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/1.8/i686-darwin12.2.1 -I.
DEFS     = 
CPPFLAGS =  -I/opt/X11/include -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE  -I/opt/X11/include
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
target_prefix = 
LOCAL_LIBS = 
LIBS =  -lc  -L/opt/local/lib -ldl -lobjc  
SRCS = gherkin_lexer_el.c
OBJS = gherkin_lexer_el.o
TARGET = gherkin_lexer_el
DLLIB = $(TARGET).bundle
EXTSTATIC = 
STATIC_LIB = 

BINDIR        = $(bindir)
RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR = /Users/felixrodriguez/Documents/code/selenium/vendor/gems/ruby/1.8/gems/gherkin-2.12.0/lib$(target_prefix)
RUBYARCHDIR = /Users/felixrodriguez/Documents/code/selenium/vendor/gems/ruby/1.8/gems/gherkin-2.12.0/lib$(target_prefix)

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



$(OBJS): ruby.h defines.h
