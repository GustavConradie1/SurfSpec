#! python 3
# requirements: numpy

import Rhino
import rhinoscriptsyntax as rs
import numpy as np
import os

def getsubd():
    filter = Rhino.DocObjects.ObjectType.Brep
    res, objref = Rhino.Input.RhinoGet.GetOneObject('Select SubD', False, filter)
    if not objref or res != Rhino.Commands.Result.Success:
        return
    return objref.Brep()

def surfacepts(subd, n=8):
    # Chebyshev points on [0, 1]
    x = np.polynomial.chebyshev.chebpts2(n)
    x = (x + 1) / 2

    faces = list(subd.Faces)
    pts = np.zeros((len(faces), n, n, 3))
    for i, f in enumerate(faces):
        domu = f.Domain(0)
        domv = f.Domain(1)
        for j in range(n):
            u = domu.ParameterAt(x[j])
            for k in range(n):
                v = domv.ParameterAt(x[k])
                p = f.PointAt(u, v)
                pts[i,j,k,:] = [p.X, p.Y, p.Z]
    return pts
    
def main():
    n = 8
    filename = 'C:/Users/gusta/Downloads/triceratops_final.csv'
    subd = getsubd()
    x = surfacepts(subd, n)
    np.savetxt(filename, x.reshape(-1, 3), delimiter=',')
 
if __name__ == "__main__":
    main()
