#Centroid_of_n_Particle_System

n=int(input("number of particles= "))

mass=[]
x_coord=[]
y_coord=[]
z_coord=[]

print("Insert (mass//x//y//z)")

for i in range (n):
  
  m=float(input())
  x=float(input())
  y=float(input())
  z=float(input())

  mass.append(m)
  x_coord.append(x)
  y_coord.append(y)
  z_coord.append(z)


mx=0
my=0
mz=0

for i in range (n):

  mx=mx+mass[i]*x_coord[i]
  my=my+mass[i]*y_coord[i]
  mz=mz+mass[i]*z_coord[i]

cntrx=mx/sum(mass)
cntry=my/sum(mass)
cntrz=mz/sum(mass)

print("Coord.s of the Centroid")

print("X=",cntrx)
print("Y=",cntry)
print("Z=",cntrz)



#GameMaker//ShajiratulYakeen
#Assassin//NayeemulHasan
