import time
def A(m, n):
    if m == 0:
        return n + 1
    if n == 0:
        return A(m - 1, 1)
    n2 = A(m, n - 1)
    return A(m - 1, n2)
startTime = time.time()
result = A(3, 6)
# result for (3,6) = 509
elapsedTime = time.time() - startTime
print elapsedTime

# it took 0.052726984024 seconds to run on my machine