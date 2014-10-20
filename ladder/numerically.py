def solve(b):
    c = 3    
    while True:
        a1 = 2* b **3 + (2-c*c)*b**2 + 2 * b + 1
        b1 = (-a1) ** 0.25
        if(abs(b-b1)<0.0000001):
            print(b1)
            break
        b = b1

solve(1)
