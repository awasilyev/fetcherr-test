Unfortunatelly I am not familiar with calico at all.
Proposed solution is untested, based only on calico documentation, 
require additional manual step for getting api endpoints:
```
kubectl -n default get endpoints kubernetes --no-headers | awk '{ print $2 }'
```
