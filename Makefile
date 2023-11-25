deploy:
	kubectl apply -f namespace.yml
	make apply-all

apply-all:
	make apply-mongo
	make apply-backend
	make apply-frontend

apply-mongo:
	kubectl apply -f mongodb/mongo-configmap.yml
	kubectl apply -f mongodb/mongo-secret.yml
	kubectl apply -f mongodb/mongo-pv-pvc.yml
	kubectl apply -f mongodb/mongo-statefulset.yml
	kubectl apply -f mongodb/mongo-service.yml

apply-backend:
	kubectl apply -f backend/karsajobs-service.yml
	kubectl apply -f backend/karsajobs-deployment.yml

apply-frontend:
	kubectl apply -f frontend/karsajobs-ui-service.yml
	kubectl apply -f frontend/karsajobs-ui-deployment.yml

.PHONY: apply-mongo apply-backend apply-frontend apply-all deploy