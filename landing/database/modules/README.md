We may configure custom getters or actions here like. Then integrate into database like:

```
import { Database } from '@vuex-orm/core'
import Task from '@/models/Task'
import tasks from '@/database/modules/tasks'

const database = new Database()

database.register(Task, tasks)

export default database

```


```
mport Task from '@/models/Task'

const getters = {
  filteredTasks: (_, getters) => status => {
    if (status === 'completed') {
      return getters.completedTasks
    } else if (status === 'active') {
      return getters.activeTasks
    }

    return getters.allTasks
  },

  completedTasks () {
    return Task.query().where('is_completed', true).get()
  },

  activeTasks () {
    return Task.query().where('is_completed', false).get()
  },

  allTasks () {
    return Task.all()
  },

  timeToChill: (_, getters) => status => {
    return !getters.allTasks.length ||
            (status === 'active' && !getters.activeTasks.length) ||
            (status === 'completed' && !getters.completedTasks.length)
  }
}

const actions = {
  deleteTasks () {
    return this.$axios.$delete('/tasks')
      .then(response => {
        Task.delete(task => task.is_completed)

        return response
      })
      .catch(error => {
        return Promise.reject(error)
      })
  }
}

export default {
  getters,
  actions
}

```
