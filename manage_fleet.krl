ruleset manage_fleet {
  meta {
    shares __testing
  }
  global {
    __testing = { "queries": [ { "name": "__testing" } ],
                  "events": [ ] }
    showChildren = function() {
        wrangler:children()
    }
  }

  rule create_vehicle {
    select when pico new_child_request
    pre {
      new_child = newPico()
      attrs = { "parent":    myself(),
                "new_child": new_child,
                "rs_attrs":  event:attrs() }
    }
    if true
    then
      event:send(
        { "eci": new_child.eci, "eid": 151,
          "domain": "pico", "type": "child_created",
          "attrs": attrs })
    always {
      engine:installRuleset(
        { "pico_id": new_child.id, "rid": "io.picolabs.pico" });
      ent:children := children().union([new_child])
    }
  }

  rule vehicles {

  }

  rule delete_vehicle {
     select when car unneeded_vehicle
  }
}
