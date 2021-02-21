#!/bin/bash
start=`date +%s%N`
echo "Express test..."
cd ~/corebuis/express/
./node_modules/.bin/jest --watchAll=false --detectOpenHandles --forceExit
echo "Express Done."
if [ $? -ne 0 ]; then
  echo "Test Express fail! Exit"
  exit
fi

echo "Client test..."
cd ~/corebuis/client/
npm test -- --watchAll=false --detectOpenHandles --forceExit
if [ $? -ne 0 ]; then
  echo "Test Client fail! Exit"
  exit
fi

cd ~/corebuis/client/
echo "test Cypress..."
npm run cypress-memory
if [ $? -ne 0 ]; then
  echo "Test Cypress fail! Exit"
  exit
fi

echo "done!"
end=`date +%s%N`
echo `expr $end - $start`

