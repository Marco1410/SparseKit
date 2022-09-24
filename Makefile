# Makefile

COMPILER	:=  ifort
VPATH		:=  $(PWD)/Source
BINDIR		:=  $(PWD)/Bin
LIBDIR		:=  $(PWD)/SparseLibrary-v1.0
LIBOBJECTDIR	:=  /usr/include/mkl/
LIBRARIES 	:=  $(LIBDIR)/sparseLib.a
OBJECTDIR	:=  $(LIBDIR)/Objects/
FFLAGS		:=  -Ofast -qopenmp -free -qmkl=parallel -liomp5 -lpthread -ldl -module $(OBJECTDIR) -I$(LIBOBJECTDIR)
FFLAGSDebug 	:=  -g -Wall -static -fcheck=all -J$(OBJECTDIR)

OBJECTS := $(BINDIR)/Debugger.o $(BINDIR)/Utilities.o $(BINDIR)/Quicksort.o $(BINDIR)/SparseKit.o

main: 	$(OBJECTS) 
	ar rcv $(LIBDIR)/sparseLib.a $(OBJECTS)

test:	$(OBJECTS)
	$(COMPILER) $(FFLAGS)  $^ -L$(LIBDIR) $(LIBRARIES) main.f90 -o main

debug: $(OBJECTS)
	$(COMPILER) $(FFLAGSDebug) $(OBJECTS) -o main

$(BINDIR)/%.o : $(VPATH)/%.f90
	$(COMPILER) $(FFLAGS) -c $^ -o $@ 

$(LIBDIR)/%.a : $(BINDIR)/%.o
	ar rcv $^ 

clean:
	rm -f $(BINDIR)/*.o $(OBJECTDIR)/*.mod main $(LIBDIR)/*.a
