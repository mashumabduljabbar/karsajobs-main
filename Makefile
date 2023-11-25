deploy:
	kubectl apply -f namespace.yaml
	make apply-all

apply-all:
	make apply-mongo
	make apply-backend
	make apply-frontend

apply-mongo:
	kubectl apply -f mongodb/mongo-configmap.yaml
	kubectl apply -f mongodb/mongo-secret.yaml
	kubectl apply -f mongodb/mongo-pv-pvc.yaml
	kubectl apply -f mongodb/mongo-statefulset.yaml
	kubectl apply -f mongodb/mongo-service.yaml

apply-backend:
	kubectl apply -f backend/karsajobs-service.yaml
	kubectl apply -f backend/karsajobs-deployment.yaml

apply-frontend:
	kubectl apply -f frontend/karsajobs-ui-service.yaml
	kubectl apply -f frontend/karsajobs-ui-deployment.yaml

.PHONY: apply-mongo apply-backend apply-frontend apply-all deploy