
// File:    scores.dm
// Library: Forum_account.Hub
// Author:  Forum_account
//
// Contents:
//   This file contains client procs that retrieve and
//   update hub scores.

var
	const
		ADD = 1
		SUBTRACT = 2
		MAX = 3
		MIN = 4
		SET = 5

		NUMERIC = 1
		TEXT = 2

client
	proc
		// The GetScore() proc gets the value of a specific score
		// for this client. The "score" parameter is the name of
		// the score and the type parameter is either NUMERIC or
		// TEXT (this determines how the value will be interpreted).
		//
		// This proc returns the value of the score, or null if the
		// hub could not be reached.
		GetScore(score, type = NUMERIC)

			var/scores = world.GetScores(key, score)

			if(isnull(scores))
				return null

			scores = params2list(scores)

			var/value = scores[score]

			if(type == NUMERIC)
				return text2num(value)
			else
				return value

		// The SetScore() proc applies an operation to the specified
		// score. The possible operations depend on the score's type:
		//
		//   NUMERIC: SET, ADD, SUBTRACT, MAX, MIN
		//   TEXT: SET, MAX, MIN
		//
		// The SET operations writes over any current score. The ADD
		// operation adds the value to the current score. The SUBTRACT
		// operation subtracts the value from the current score. The
		// MIN and MAX operations set the hub score's value to the
		// min() or max() of the two values (the current value and the
		// new value).
		//
		// This proc returns the new value of the score, or null if the
		// hub could not be reached.
		SetScore(score, operation = ADD, value, type = NUMERIC)

			if(operation == SET)
				var/params = list2params(list("[score]" = value))
				var/result = world.SetScores(key, params)

				return isnull(result) ? null : value

			else

				if(type == NUMERIC)

					if(!isnum(value))
						CRASH("client.SetScore was passed '[value]' which is not numeric. If it's a string representing a number, call text2num() first.")

					var/hub_value = GetScore(score, type)

					if(isnull(hub_value))
						if(operation == MIN)
							hub_value = value
						else
							hub_value = 0

					if(operation == ADD)
						value = hub_value + value
					else if(operation == SUBTRACT)
						value = hub_value - value
					else if(operation == MAX)
						value = max(hub_value, value)
					else if(operation == MIN)
						value = min(hub_value, value)
					else
						CRASH("client.SetScore does not support operation [operation] for type [type].")

					// if the operation won't change the scores's value,
					// we don't need to make the world.SetScores() call.
					if(hub_value == value)
						return hub_value

					var/params = list2params(list("[score]" = value))
					var/result = world.SetScores(key, params)

					return isnull(result) ? null : value

				else if(type == TEXT)

					// if the value isn't text, convert it to text
					if(!istext(value))
						value = "[value]"

					var/hub_value = GetScore(score, type)

					if(isnull(hub_value))
						hub_value = value

					if(operation == MAX)
						value = max(hub_value, value)
					else if(operation == MIN)
						value = min(hub_value, value)
					else
						CRASH("client.SetScore does not support operation [operation] for type [type].")

					// if the operation won't change the scores's value,
					// we don't need to make the world.SetScores() call.
					if(hub_value == value)
						return hub_value

					var/params = list2params(list("[score]" = value))
					var/result = world.SetScores(key, params)

					return isnull(result) ? null : value
