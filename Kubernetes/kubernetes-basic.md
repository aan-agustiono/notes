
<table>
  <thead>
  <tr><th colspan="3">Components</th></tr>
    <tr><th>Groups</th><th width="45%">Node Master</th><th width="45%">Node Works</th></tr>
  </thead>
  <tbody>
    <tr><td>Applications</td><td>
      <ul>
        <li><code>Kube API server</code></li>
        Runs on the master node that exposes Kubernetes API for querying cluster information.
        <li><code>Etcd</code></li>
        A key store that stores Kubernetes cluster data
        <li><code>Kube Scheduler</code></li>
        Runs on the master node, which looks for newly created pods and identifies the right nodes depending on resource availability.
        <li><code>Kube Controller Manager</code></li>
        Runs on the master node and is responsible for monitoring (nodes, pods replications, and deployments) and taking action to keep the application running.
      </ul>
    </td><td valign="top">
      <ul>
        <li><code>Kubelet</code></li>
        Runs on all worker nodes and handles tasks like starting, managing, and destroying pods.
        <li><code>Kube Proxy</code></li>
        A network proxy that forwards TCP/UDP incoming requests to the backend pod.
        <li><code>Container Runtime</code></li>
        Runs pods on worker nodes (Docker, CRI-O, and containerd)
      </ul>
    </td></tr>
  </tbody>
  <thead>
  <tr><th colspan="3">System Requirements</th></tr>
    <tr><th>Specs</th><th>Node Master</th><th>Node Works</th></tr>
  </thead>
  <tbody>
    <tr><td>CPU</td><td>2 Core</td><td>2 Core</td></tr>
    <tr><td>Memory</td><td>2 GB (minimum)</td><td>2 GB (minimum)</td></tr>
    <tr><td>Swap</td><td>Disable Swap</td><td>Disable Swap</td></tr>
    <tr><td>Others</td><td>Unique hostname, MAC address, product_uuid for every node</td><td>Unique hostname, MAC address, product_uuid for every node</td></tr>
  </tbody>  
</table>
