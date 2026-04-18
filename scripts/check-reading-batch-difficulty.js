const fs = require('fs');
const path = require('path');

const files = [
  'n5_reading_short_batch_05.json',
  'n5_reading_medium_batch_05.json',
  'n5_reading_search_batch_05.json'
];

for (const file of files) {
  const filePath = path.join(__dirname, '..', 'data', 'n5-batches', file);
  const data = JSON.parse(fs.readFileSync(filePath, 'utf8'));

  const difficultyCount = {};
  for (const set of data) {
    if (set.difficulty) {
      difficultyCount[set.difficulty] = (difficultyCount[set.difficulty] || 0) + 1;
    }
    if (set.questions && Array.isArray(set.questions)) {
      for (const q of set.questions) {
        if (q.difficulty) {
          difficultyCount[q.difficulty] = (difficultyCount[q.difficulty] || 0) + 1;
        }
      }
    }
  }

  const has1 = !!difficultyCount[1];
  const has5 = !!difficultyCount[5];

  console.log(`${file.replace('.json', '')}:`);
  console.log(`  difficulty distribution:`, difficultyCount);
  console.log(`  has1=${has1} has5=${has5}`);
  console.log();
}
