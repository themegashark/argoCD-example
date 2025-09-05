{{- define "simple-webapp.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{- define "simple-webapp.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "simple-webapp.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "simple-webapp.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "simple-webapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "simple-webapp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "simple-webapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}