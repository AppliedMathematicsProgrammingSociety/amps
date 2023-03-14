import pygame
from ball2 import Ball2,collisionCheck,momentum

def xfunc(x=0,vx=0):
    return vx
def vxfunc(x=0,vx=0):
    return 0
def yfunc(y=0,vy=0):
    return vy
def vyfunc(y=0,vy=0):
    return 980000

r1 = 10
r2 = 10

pygame.init()

win = pygame.display.set_mode((500, 500))

pygame.display.set_caption("Random bs go")
run = True

b2 = Ball2()
b3 = Ball2()
b3.x = 300
b3.y = 300
b2.vx=(-2000)
b3.vx=(2000)
b2.r = r1
b3.r = r2
while run:
    pygame.time.delay(10)
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            run = False
    win.fill((250, 250, 250))
    pygame.draw.circle(win, (255, 0, 0), (b2.x, b2.y), b2.r)
    pygame.draw.circle(win, (0, 255, 0), (b3.x, b3.y), b3.r)
    pos = b2.getPos()
    vel = b2.getVel()
    b2.updatePos(xfunc, yfunc, vxfunc, vyfunc)
    b3.updatePos(xfunc, yfunc, vxfunc, vyfunc)
    b2.checkBounds()
    b3.checkBounds()
    if collisionCheck(b2.getPos(),b3.getPos(),r1,r2):
        px = momentum(b2.vx, b3.vx, b2.m, b3.m)
        py = momentum(b2.vy, b3.vy, b2.m, b3.m)
        b2.vx = px[0]
        b3.vx = px[1]
        b2.vy = py[0]
        b3.vy = py[1]
    pygame.display.update()
    #print(vel)
pygame.quit()
