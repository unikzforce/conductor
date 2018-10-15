curl -X POST \
  http://conductor-server:8080/api/metadata/taskdefs \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '[
  {
    "name": "t_em_register_user",
    "retryCount": 3,
    "timeoutSeconds": 1200,
    "inputKeys": [
      "studentId",
      "educationalInstituteId",
      "majorName",
      "degree",
      "startSemester",
      "person"
    ],
    "outputKeys": [
      "responseCode",
      "responseStatus"
    ],
    "timeoutPolicy": "TIME_OUT_WF",
    "retryLogic": "FIXED",
    "retryDelaySeconds": 600,
    "responseTimeoutSeconds": 3600
  },
  {
    "name": "t_bm_register_cardholder",
    "retryCount": 3,
    "timeoutSeconds": 1200,
    "inputKeys": [
      "studentId",
      "educationalInstituteId",
      "majorName",
      "degree",
      "startSemester",
      "person"
    ],
    "outputKeys": [
      "responseCode",
      "responseStatus"
    ],
    "timeoutPolicy": "TIME_OUT_WF",
    "retryLogic": "FIXED",
    "retryDelaySeconds": 600,
    "responseTimeoutSeconds": 3600
  }
]'&&
curl -X POST \
  http://conductor-server:8080/api/metadata/workflow \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '{
  "name": "w_em_register_student",
  "description": "A workflow for saving student with 2 tasks",
  "version": 1,
  "tasks": [
    {
      "name": "t_em_register_user",
      "taskReferenceName": "t_em_register_user",
      "type": "SIMPLE",
      "startDelay": 0,
      "optional": false
    },
    {
      "name": "t_bm_register_cardholder",
      "taskReferenceName": "t_bm_register_cardholder",
      "type": "SIMPLE",
      "startDelay": 0,
      "optional": false
    }
  ],
  "schemaVersion": 2,
  "restartable": true
}'