$ docker run --detach --net=host --name=kube-apiserver \
    --restart=always \
    --volume=/usr/share/ca-certificates:/etc/ssl/certs \
    --volume=/var/run/kubernetes:/var/run/kubernetes \
    --volumes-from=kube-apiserver-conf-0.0.1 \
    kelseyhightower/kube-apiserver:0.20.0 \
    --admission-control=LimitRanger,ServiceAccount,ResourceQuota \
    --authorization-mode=ABAC \
    --authorization-policy-file=/etc/kubernetes/policy.jsonl \
    --client-ca-file=/etc/kubernetes/ca.pem \
    --cluster-name=kubernetes \
    --etcd-servers=http://127.0.0.1:2379 \
    --insecure-bind-address=127.0.0.1 \
    --insecure-port=8080 \
    --logtostderr=true \
    --secure-port=6443 \
    --service-cluster-ip-range=10.200.20.0/24 \
    --tls-cert-file=/etc/kubernetes/server.pem \
    --tls-private-key-file=/etc/kubernetes/server-key.pem \
    --v=2