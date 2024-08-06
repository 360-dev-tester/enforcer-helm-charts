{{- define "enforcer-service.name" -}}
{{- .Chart.Name }}
{{- end }}

{{- define "enforcer-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end }}

{{- define "enforcer-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end }}

{{- define "enforcer-service.labels" -}}
helm.sh/chart: {{ include "enforcer-service.chart" . }}
{{ include "enforcer-service.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "enforcer-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enforcer-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
