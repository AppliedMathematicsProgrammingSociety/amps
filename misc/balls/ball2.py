from grav_force import solEuler, rk4
from math import fabs, sqrt
def collisionCheck(p1,p2,r1=5,r2=5):
    collide = False
    d = sqrt((p1[0]-p2[0])**2+(p1[1]-p2[1])**2)
    r = (r1+r2)
    if d>r:
        collide = False
    else:
        collide = True
    return collide

def momentum(u1,u2,m1,m2):
    v1 = (m1-m2)/(m1+m2)*u1+2*m2/(m1+m2)*u2
    v2 = 2*m1/(m1+m2)*u1-(m1-m2)/(m1+m2)*u2
    return [v1,v2]

def near(x,y,z):
    if fabs(y-x)>fabs(z-x):
        return z
    else:
        return y
class Ball2:
    def __init__(self,x=200,y=200,vx=0,vy=0,m=1,r=5):
        self.x = x
        self.vx = vx
        self.y = y
        self.vy = vy
        self.m = m
        self.r = r
        self.rgb = (255, 0, 0)
    def getPos(self):
        return [self.x, self.y]
    def getVel(self):
        return [self.vx, self.vy]
    def updatePos(self, xfunc, yfunc, vxfunc, vyfunc):
        px = solEuler(self.x, self.vx, xfunc, vxfunc)
        self.x = px[0]
        self.vx = px[1]
        py = solEuler(self.y, self.vy, yfunc, vyfunc)
        self.y = py[0]
        self.vy = py[1]
        return [self.x, self.y]
    def checkBounds(self):
        if self.x < self.r or self.x > 500-self.r:
            v = momentum(self.vx,0,self.m,10000000)
            self.vx = v[0]
            print(self.getVel())
            self.x = near(self.x, self.r, 500-self.r)
        if self.y < self.r or self.y > 500-self.r:
            v = momentum(self.vy, 0, self.m, 10000000)
            self.vy = v[0]
            self.y = near(self.y, self.r, 500-self.r)
            print(self.getVel())
    def totalEnergy(self):
        return (0.5*self.m*sqrt(self.vx**2+self.vy**2)+self.m*980000*(500-self.y))

