FROM centos
RUN mkdir actions-runner && cd actions-runner
RUN yum install jq -y 
ENV RUNNER_ALLOW_RUNASROOT=true
WORKDIR /home/centos/actions-runner
COPY install-latest-runner.sh /home/centos/actions-runner
RUN echo "Downloading latest runner ..."
RUN chmod +x install-latest-runner.sh 
RUN ./install-latest-runner.sh 
RUN ./bin/installdependencies.sh



    - uses: actions/checkout@v3
    - name: Use Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18.x'
    - name: Set Heap size
      run: export NODE_OPTIONS="--max_old_space_size=8192"   
    - name: Install dependencies
      run: npm install
    - name: Cache clear  
      run: npm cache clean --force
    - name: Build app
      run: npm run build
      env:
         CI: false
