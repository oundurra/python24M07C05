from .models import Vehiculo, Chofer, RegistroContabilidad
from datetime import date

def crear_vehiculo(patente, marca, modelo, year):
    vehiculo = Vehiculo()
    vehiculo.patente = patente
    vehiculo.marca = marca
    vehiculo.modelo = modelo
    vehiculo.year = year

    vehiculo.save()
    
def crear_chofer(rut, nombre, apellido, patente):
    vehiculo = Vehiculo.objects.get(patente=patente)
    
    chofer = Chofer()
    chofer.rut = rut
    chofer.nombre = nombre
    chofer.apellido = apellido
    chofer.activo = False
    chofer.creacion_registro = date.today()
    chofer.patente = vehiculo

    chofer.save()

def crear_registro_contable(valor, patente):
    vehiculo = Vehiculo.objects.get(patente=patente)

    registro_contabilidad = RegistroContabilidad()
    registro_contabilidad.fecha_compra = date.today()
    registro_contabilidad.valor = valor
    registro_contabilidad.patente = vehiculo

    registro_contabilidad.save()

def deshabilitar_chofer(rut):
    chofer = Chofer.objects.get(rut=rut)
    chofer.activo = False
    chofer.save()

def habilitar_chofer(rut):
    chofer = Chofer.objects.get(rut=rut)
    chofer.activo = True
    chofer.save()

def deshabilitar_vehiculo(patente):
    return None

def habilitar_vehiculo(patente):
    return None

def obtener_vehiculo(patente):
    return Vehiculo.objects.get(patente=patente)

def obtener_chofer(rut):
    return Chofer.objects.get(rut=rut)

def asignar_chofer_a_vehiculo(rut, patente):
    vehiculo = Vehiculo.objects.get(patente=patente)
    chofer = Chofer.objects.get(rut=rut)
    chofer.patente = vehiculo 
    chofer.save()


def imprimir_datos_vehiculos():
    vehiculos = Vehiculo.objects.all()

    for vehiculo in vehiculos:
        print(f'Patente:{vehiculo.patente} Marca:{vehiculo.marca} Modelo:{vehiculo.modelo} Año:{vehiculo.year}' )
