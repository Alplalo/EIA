# f90Compilador
FC = gfortran

# Opciones de compilación
FFLAGS = -O2 -Wall

# Objetivos
all: main.exe clean help create_tar run

# Reglas de compilación
main.exe: demanar_dimensio.o demanar_vector.o operacions_vector.o escriure_results.o main.o
	$(FC) $(FFLAGS) -o $@ $^

%.mod: %.f90
	$(FC) $(FFLAGS) -c $<

%.o: %.f90
	$(FC) $(FFLAGS) -c $<

# Regla ejecutar
run: main.exe
	.\main.exe

# Regla para limpiar todos .o
clean:
	del *.o
	del *.mod

# Regla help
help:
	@echo "Reglas disponibles:"
	@echo " all: Compila el programa, limpia los .o y crea un .tgz"
	@echo " run: Ejecuta el programa"
	@echo " clean: Limpia los .o"
	@echo " create_tar: Crea un .tgz con el programa y el Makefile"
	@echo " help: Muestra esta ayuda"

# Regla para crear .tgz
create_tar:
	tar -cvzf ejercicio.tgz main.f90 demanar_dimensio.f90 demanar_vector.f90 operacions_vector.f90 escriure_results.f90 Makefile

# Usar las reglas
.PHONY: all clean help create_tar run
