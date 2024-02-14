# component

![Version: 0.2.3](https://img.shields.io/badge/Version-0.2.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

A Helm chart template for supporting different kind of application deployment.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| component.autoscaling.behavior.scaleDown.policies[0].periodSeconds | int | `60` |  |
| component.autoscaling.behavior.scaleDown.policies[0].type | string | `"Percent"` |  |
| component.autoscaling.behavior.scaleDown.policies[0].value | int | `10` |  |
| component.autoscaling.behavior.scaleDown.policies[1].periodSeconds | int | `60` |  |
| component.autoscaling.behavior.scaleDown.policies[1].type | string | `"Pods"` |  |
| component.autoscaling.behavior.scaleDown.policies[1].value | int | `2` |  |
| component.autoscaling.behavior.scaleDown.selectPolicy | string | `"Min"` |  |
| component.autoscaling.behavior.scaleDown.stabilizationWindowSeconds | int | `300` |  |
| component.autoscaling.behavior.scaleUp.policies[0].periodSeconds | int | `30` |  |
| component.autoscaling.behavior.scaleUp.policies[0].type | string | `"Percent"` |  |
| component.autoscaling.behavior.scaleUp.policies[0].value | int | `100` |  |
| component.autoscaling.behavior.scaleUp.policies[1].periodSeconds | int | `30` |  |
| component.autoscaling.behavior.scaleUp.policies[1].type | string | `"Pods"` |  |
| component.autoscaling.behavior.scaleUp.policies[1].value | int | `2` |  |
| component.autoscaling.behavior.scaleUp.selectPolicy | string | `"Max"` |  |
| component.autoscaling.behavior.scaleUp.stabilizationWindowSeconds | int | `0` |  |
| component.autoscaling.enabled | bool | `true` |  |
| component.autoscaling.maxReplicas | int | `7` |  |
| component.autoscaling.minReplicas | int | `3` |  |
| component.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| component.configmap.data."config.js" | string | `"const envConfig = (() => {\n  return {\n    \"VITE_DEPLOY_ENVIRONMENT\":\"{{ .Release.Name }}-{{ .Release.Namespace }}\"\n  };\n})();"` |  |
| component.configmap.data."config.prod.js" | string | `"const envConfig = (() => {\n  return {\n    \"VITE_DEPLOY_ENVIRONMENT\":\"static\"\n  };\n})();"` |  |
| component.configmap.enabled | bool | `true` |  |
| component.containers[0].env.fromLocalConfigmap[0].key | string | `"config.js"` |  |
| component.containers[0].env.fromLocalConfigmap[0].name | string | `"frontend-configmap"` |  |
| component.containers[0].env.fromLocalConfigmap[1].key | string | `"config.prod.js"` |  |
| component.containers[0].env.fromLocalConfigmap[1].name | string | `"frontend-prod-configmap"` |  |
| component.containers[0].env.fromValues[0].name | string | `"BACKEND_URL"` |  |
| component.containers[0].env.fromValues[0].value | string | `"http://{{ .Release.Name }}-backend"` |  |
| component.containers[0].env.fromValues[1].name | string | `"LOG_LEVEL"` |  |
| component.containers[0].env.fromValues[1].value | string | `"info"` |  |
| component.containers[0].image | string | `"frontend"` |  |
| component.containers[0].livenessProbe.failureThreshold | int | `3` |  |
| component.containers[0].livenessProbe.httpGet.path | string | `"/health"` |  |
| component.containers[0].livenessProbe.httpGet.port | int | `3001` |  |
| component.containers[0].livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| component.containers[0].livenessProbe.initialDelaySeconds | int | `15` |  |
| component.containers[0].livenessProbe.periodSeconds | int | `30` |  |
| component.containers[0].livenessProbe.successThreshold | int | `1` |  |
| component.containers[0].livenessProbe.timeoutSeconds | int | `5` |  |
| component.containers[0].name | string | `"frontend"` |  |
| component.containers[0].ports[0].containerPort | int | `3000` |  |
| component.containers[0].ports[0].name | string | `"http"` |  |
| component.containers[0].ports[0].protocol | string | `"TCP"` |  |
| component.containers[0].ports[1].containerPort | int | `3001` |  |
| component.containers[0].ports[1].name | string | `"http2"` |  |
| component.containers[0].ports[1].protocol | string | `"TCP"` |  |
| component.containers[0].readinessProbe.failureThreshold | int | `30` |  |
| component.containers[0].readinessProbe.httpGet.path | string | `"/health"` |  |
| component.containers[0].readinessProbe.httpGet.port | int | `3001` |  |
| component.containers[0].readinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| component.containers[0].readinessProbe.initialDelaySeconds | int | `5` |  |
| component.containers[0].readinessProbe.periodSeconds | int | `2` |  |
| component.containers[0].readinessProbe.successThreshold | int | `1` |  |
| component.containers[0].readinessProbe.timeoutSeconds | int | `2` |  |
| component.containers[0].registry | string | `"{{ .Values.global.registry }}"` |  |
| component.containers[0].repository | string | `"{{ .Values.global.repository }}"` |  |
| component.containers[0].resources.limits.cpu | string | `"100m"` |  |
| component.containers[0].resources.limits.memory | string | `"150Mi"` |  |
| component.containers[0].resources.requests.cpu | string | `"30m"` |  |
| component.containers[0].resources.requests.memory | string | `"50Mi"` |  |
| component.containers[0].securityContext.capabilities.add[0] | string | `"NET_BIND_SERVICE"` |  |
| component.containers[0].tag | string | `"{{ .Values.global.tag }}"` |  |
| component.deployment.enabled | bool | `true` |  |
| component.deploymentStrategy.type | string | `"Recreate"` |  |
| component.enabled | bool | `true` |  |
| component.route.enabled | bool | `true` |  |
| component.route.host | string | `"{{ .Release.Name }}-frontend.{{ .Values.global.domain }}"` |  |
| component.route.targetPort | string | `"http"` |  |
| component.service.enabled | bool | `true` |  |
| component.service.ports[0].name | string | `"http"` |  |
| component.service.ports[0].port | int | `80` |  |
| component.service.ports[0].protocol | string | `"TCP"` |  |
| component.service.ports[0].targetPort | int | `3000` |  |
| component.service.type | string | `"ClusterIP"` |  |

